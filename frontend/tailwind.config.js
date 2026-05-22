/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode : "class",
  theme: {
    extend: {
      colors: {
        'restro-green-light' : 'var(--restro-green-light)',
        'restro-green' : 'var(--restro-green)',
        'restro-green-10' : 'var(--restro-green-10)',
        'restro-border-green' : 'var(--restro-border-green)',
        'restro-text' : 'var(--restro-text)',
        'restro-gray' : 'var(--restro-gray)',
        'restro-ring' : 'var(--restro-ring)',
        'restro-bg-gray' : 'var(--restro-bg-gray)',
        'restro-card-bg' : 'var(--restro-card-bg)',
        'restro-button-hover' : 'var(--restro-button-hover)',
        'restro-green-button-hover' : 'var(--restro-green-button-hover)',
        'restro-red' : 'var(--restro-red)',
        'restro-bg-red' : 'var(--restro-bg-red)',
        'restro-red-hover' : 'var(--restro-red-hover)',
        'restro-yellow' : 'var(--restro-yellow)',
        'restro-bg-yellow' : 'var(--restro-bg-yellow)',
        'restro-yellow-hover' : 'var(--restro-yellow-hover)',
        'restro-checkbox' : 'var(--restro-checkbox)',
        'restro-sidebar-bg' : 'var(--restro-sidebar-bg)',
        'restro-sidebar-active' : 'var(--restro-sidebar-active)',
        'restro-sidebar-text' : 'var(--restro-sidebar-text)',
        'restro-sidebar-muted' : 'var(--restro-sidebar-muted)',
        'restro-surface' : 'var(--restro-surface)',
        'restro-surface-muted' : 'var(--restro-surface-muted)',

        'background': 'var(--background)',
        'foreground': 'var(--foreground)',


        // 'restro-green-light': "#ECF1EB",
        'restro-green': "var(--restro-green)",
        'restro-green-dark': "var(--restro-green-dark)",
        'restro-border-green-light': "var(--restro-border-green-light)",
        'restro-superadmin-widget-bg': "var(--restro-superadmin-widget-bg)",
        'restro-superadmin-text-green': "var(--restro-superadmin-text-green)",
        'restro-superadmin-text-black': "var(--restro-superadmin-text-black)",

        // 'restro-text-light-mode' : "#FFFFFF",
        // 'restro-text-dark-mode' : "#F0F0F0",
        
        
        // dark theme colors
        'restro-green-dark-mode' : "#255F38",
        'restro-border-dark-mode' : '#333333',
        'restro-text-dark-mode' : '#F0F0F0',
        'restro-bg-seconday-dark-mode' : '#232323',
        'restro-gray-dark-mode' : '#121212',
        'restro-bg-card-dark-mode' : '#121212',
        'restro-card-border-dark-mode' : '#222222',
        'restro-card-iconbg' : '#252525',
        'restro-bg-hover-dark-mode' : '#353535',
        'restro-bg-button-dark-mode' : '#33632E',
        'restro-placeholder-outline-dark-mode' : '#636161',
        
        //light theme colors
        'restro-border-light-mode' : '#DCE7DB',
        'restro-text-light-mode' : '#B5C0D1',


      }
    },
  },
  plugins: [require("daisyui"), require('tailwind-scrollbar'),],
  daisyui: {
    themes: ["light", "black"],
    darkTheme: "black",
  }
}
