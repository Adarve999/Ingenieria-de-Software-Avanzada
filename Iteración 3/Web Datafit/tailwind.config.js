module.exports = {
  purge: [
    './public/**/*.html',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: theme => ({
        'wave-pattern': "url('../img/wave-white.png')",
        'patron2': "url('../img/patron2.jpg')",
        'patronGimnasio': "url('../img/patronGimnasio.jpg')",
        'wave-pink': "url('../img/wave-pink.png')",
        'yellow-dots': "url('../img/pattern-yellow-dots.png')",
        'actividades':"url('../img/actividades.jpg')",
        'wave-blue': "url('../img/wave-blue.png')",
      }),
      screens:{
        'xsm': '320px'

      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
