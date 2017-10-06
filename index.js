const puppeteer = require('puppeteer');
const moment = require('moment');

if (!process.argv[2]) {
  console.log('Must supply a URL.');
  process.exit(1);
}

(async () => {
  const browser = await puppeteer.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });
  const page = await browser.newPage();
  await page.goto(process.argv[2]);
  console.log(await page.content());
  try {
    await page.screenshot({
      path: `/screenshot/screenshot-${moment().format(
        'YYYYMMDD-HHmmssSS',
      )}.png`,
      fullPage: true,
    });
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
  await browser.close();
})();
