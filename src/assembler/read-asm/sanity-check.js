// cli for creating the cli-instance

const fs = require('../../utils').fs;

module.exports = (argv) => {
  if (!argv.i || !argv.o) {
    console.log('Compile: node src/assembler -i [script.aspl] -o [file.bin] ');
    console.log('Debug:   node src -p [file.bin] --step');
    console.log('Execute: node src -p [file.bin] ');
    process.exit(1);
  }

  return fs.statAsync(argv.i)
    .then(stats => {
      if (!stats.isFile()) {
        throw new Error(`ASPL file ${argv.i} is not valid. Exiting...`);
      }
    })
    .catch(err => {
      console.error(err.message);
      process.exit(1);
    });
}
