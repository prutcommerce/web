module.exports = {
  purge: [
    './src/**/*.elm',
    './js/app.js',
    './html/index.html',
    './scss/styles.sass',
  ],
  darkMode: 'media',
  theme: {
    extend: {},
  },
  variants: {
    extend: {
      gridTemplateRows: {
        '[auto,auto,1fr]': 'auto auto 1fr',
      },
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio')
  ],
};
