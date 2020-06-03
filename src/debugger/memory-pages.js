// actual memory sice of a single displayed mem.page

const { DEBUG, MEM_SIZE } = require('../constants');
const { arrayAsHex } = require('../utils');
const PAGE_SIZE = MEM_SIZE / DEBUG.NUM_PAGES;

module.exports = (memory, page, ip) => {
  const offset = page * PAGE_SIZE;
  const memoryPage = memory.slice(offset, offset + PAGE_SIZE);
  return arrayAsHex(memoryPage, offset, ip);
}
