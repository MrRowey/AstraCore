document.addEventListener('DOMContentLoaded', () => {
  const themeToggleBtn = document.getElementById('theme-toggle');
  
  // Check local storage or default to OS preference
  const savedTheme = localStorage.getItem('theme');
  const systemPrefersLight = window.matchMedia('(prefers-color-scheme: light)').matches;
  
  // Determine starting system setting
  let currentTheme = savedTheme || (systemPrefersLight ? 'light' : 'dark');
  
  // Set initial engine state
  document.documentElement.setAttribute('data-theme', currentTheme);

  // Toggle Functionality
  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', () => {
      currentTheme = document.documentElement.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
      
      // Update DOM context
      document.documentElement.setAttribute('data-theme', currentTheme);
      // Persist configuration choice
      localStorage.setItem('theme', currentTheme);
    });
  }
});