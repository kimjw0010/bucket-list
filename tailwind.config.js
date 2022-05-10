module.exports = {
  content: [
    "./src/main/resources/static/**/*.{js,jsx,ts,tsx}",
    "./src/main/resources/templates/**/*.html",
    "./src/main/webapp/WEB-INF/views/**/*.jsp",
  ],
  theme: {
    extend: {
      colors: {
        mainGreen1: "#557B83",
        mainGreen2: "#39AEA9",
        mainGreen3: "#A2D5AB",
        mainGreen4: "#E5EFC1",
      },
    },
  },
  plugins: [],
};
