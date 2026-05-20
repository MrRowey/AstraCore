require "ipaddr"
require "minitest/autorun"
require "pathname"
require "yaml"

class RepositoryIntegrityTest < Minitest::Test
  REPO_ROOT = Pathname.new(__dir__).parent
  DOCS_ROOT = REPO_ROOT.join("docs")
  NODES_DATA_PATH = DOCS_ROOT.join("_data", "nodes.yml")
  NODE_PAGES_DIR = DOCS_ROOT.join("nodes")
  ROLLBACK_WORKFLOW_PATH = REPO_ROOT.join(".github", "workflows", "rollback.yml")
  REQUIRED_NODE_KEYS = %w[id name role description status ip cpu memory].freeze
  ALLOWED_NODE_STATUSES = %w[Online Offline Planned].freeze

  def test_nodes_data_entries_have_required_schema
    ids = nodes_data.map do |node|
      REQUIRED_NODE_KEYS.each do |key|
        assert node.key?(key), "Expected #{node.inspect} to include #{key}"
      end

      assert_match(/\Apve-[a-z0-9-]+\z/, node.fetch("id"))
      assert_includes ALLOWED_NODE_STATUSES, node.fetch("status")

      ip = IPAddr.new(node.fetch("ip"))
      assert ip.ipv4?, "Expected #{node.fetch("id")} to use an IPv4 address"
      assert ip.private?, "Expected #{node.fetch("id")} to use a private IP address"

      node.fetch("id")
    end

    assert_equal ids.uniq.length, ids.length, "Expected node IDs to be unique"
  end

  def test_node_pages_match_documented_nodes
    expected_ids = nodes_data.map { |node| node.fetch("id") }.sort
    actual_ids = Dir[NODE_PAGES_DIR.join("*.md")].map { |path| File.basename(path, ".md") }.sort

    assert_equal expected_ids, actual_ids
  end

  def test_each_documented_node_has_a_matching_detail_page
    nodes_data.each do |node|
      page_path = NODE_PAGES_DIR.join("#{node.fetch("id")}.md")
      assert page_path.file?, "Expected #{page_path.relative_path_from(REPO_ROOT)} to exist"

      front_matter = read_front_matter(page_path)
      assert_equal "node", front_matter["layout"]

      REQUIRED_NODE_KEYS.each do |key|
        message = "Expected #{page_path.basename} #{key} to match docs/_data/nodes.yml"
        if node[key].nil?
          assert_nil front_matter[key], message
        else
          assert_equal node[key], front_matter[key], message
        end
      end
    end
  end

  def test_rollback_workflow_references_the_expected_secret_and_compose_file
    workflow_contents = ROLLBACK_WORKFLOW_PATH.read

    assert_includes workflow_contents, "secrets.DEPLOY_SSH_KEY"
    assert_includes workflow_contents, "nodes/${{ inputs.node }}/docker-compose.yml"
  end

  private

  def nodes_data
    @nodes_data ||= YAML.safe_load(NODES_DATA_PATH.read)
  end

  def read_front_matter(path)
    contents = path.read
    _, raw_front_matter, = contents.split(/^---\s*$\n?/, 3)
    YAML.safe_load(raw_front_matter)
  end
end
