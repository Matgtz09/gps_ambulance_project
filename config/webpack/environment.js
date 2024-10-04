const { environment } = require('@rails/webpacker');
const path = require('path');

// Set the entry point for the application
environment.entry.set('application', './app/javascript/packs/application.js');

// Ensure unnecessary Node configurations are not included
environment.config.node = {
  global: true,
  __filename: true,
  __dirname: true,
  fs: 'empty',
  net: 'empty',
  tls: 'empty',
  child_process: 'empty'
};

module.exports = environment;