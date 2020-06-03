// throw message when compiler to .bin file

const fs = require('../utils').fs;

module.exports = (filename) =>
  (unit16buffer) => fs
    .writeFileAsync(filename, new Buffer(unit16buffer.buffer))
    .then(() => {
      console.log(`Successfully compiled to binary file ${filename}`);
    });
