// main cli entrypoint

const fs = require('../utils').fs;

module.exports = (argv) => {
  if (!argv.p) {
    console.log('Compile: node src/assembler -i [script.aspl] -o [file.bin] ');
    console.log('Debug:   node src -p [file.bin] --step');
    console.log('Execute: node src -p [file.bin] ');
    process.exit(1);
  }

  return fs
    .statAsync(argv.p)
    .then(stats => {
      if (!stats.isFile()) {
        throw new Error(`Program file ${argv.p} is not valid. Exiting...`);
      }
    })
    .catch(err => {
      console.error(err.message);
      process.exit(1);
    });
}
