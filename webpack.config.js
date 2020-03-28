const path = require('path');

const dev = process.env.NODE_ENV === 'development';

module.exports = {
  target: 'node',
  node: {
    global: false,
    __filename: false,
    __dirname: false,
  },
  watch: !!dev,
  mode: dev ? 'development' : 'production',
  entry: path.join(__dirname, 'src', 'index.js'),
  output: {
    filename: 'index.js',
    path: path.join(__dirname, 'dist'),
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
          },
        },
      },
    ],
  },
};
