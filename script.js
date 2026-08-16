/**
 * AstraCore - Minimal Vanilla JS
 * Handles mobile navigation toggle and active section highlighting.
 */

document.addEventListener('DOMContentLoaded', () => {
  // Set current year in footer
  document.getElementById('year').textContent = new Date().getFullYear();

  // Mobile Navigation Toggle
  const toggleBtn = document.querySelector('.mobile-toggle');
  const navLinks = document.querySelector('.nav-links');

  toggleBtn.addEventListener('click', () => {
    navLinks.classList.toggle('show');
    const isExpanded = navLinks.classList.contains('show');
    toggleBtn.setAttribute('aria-expanded', isExpanded);
  });

  // Close mobile menu when a link is clicked
  document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', () => {
      if (navLinks.classList.contains('show')) {
        navLinks.classList.remove('show');
        toggleBtn.setAttribute('aria-expanded', 'false');
      }
    });
  });

  // Active Section Highlighting via Intersection Observer
  const sections = document.querySelectorAll('section');
  const navItems = document.querySelectorAll('.nav-links a');

  const observerOptions = {
    root: null,
    rootMargin: '-20% 0px -60% 0px', // Trigger when section is fairly central in viewport
    threshold: 0
  };

  const observerCallback = (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        // Remove active class from all links
        navItems.forEach(item => item.classList.remove('active'));
        
        // Add active class to the corresponding link
        const activeId = entry.target.getAttribute('id');
        const activeLink = document.querySelector(`.nav-links a[href="#${activeId}"]`);
        if (activeLink) {
          activeLink.classList.add('active');
        }
      }
    });
  };

  const observer = new IntersectionObserver(observerCallback, observerOptions);
  
  sections.forEach(section => {
    observer.observe(section);
  });
});