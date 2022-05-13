module.exports = {
  content: [
    "./**/*.{js,jsx,ts,tsx}",
    "../templates/**/*.html",
    "../../webapp/WEB-INF/views/**/*.jsp",
  ],
  theme: {
    extend: {
      colors: {
        mainGreen1: "#557B83",
        mainGreen2: {
          100: "#39AEA9",
          200: "#00ACA6",
        },
        mainGreen3: "#A2D5AB",
        mainGreen4: "#E5EFC1",
      },
    },
  },
  plugins: [],
};
