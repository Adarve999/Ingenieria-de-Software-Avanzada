module.exports = {
  purge: [
    './public/**/*.html',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: theme => ({
        'wave-pattern': "url('../img/wave-white.png')",
        'actividades':"url('../img/actividades.jpg')",
        'hero':"url('../img/hero.jpg')",
        'fondoActividades':"url('../img/fondoActividades.jpg')"
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
