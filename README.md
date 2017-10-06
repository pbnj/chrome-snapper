# chrome-snapper

> 🏙 Convert URLs to images using headless Chrome, [Puppeteer](https://github.com/GoogleChrome/puppeteer), & Docker

## The Problem

I often need to investigate suspicious URLs/hyperlinks, but visiting them directly from my machine could lead to compromise (e.g. malware infections, drive-by downloads ...etc).

I could potentially visit the suspicious resources inside virtual machines, but this method seems slow, clunky, and bloated for this particular use-case.

## This Solution

This project, inspired by [similar ones](https://github.com/kimmobrunfeldt/url-to-image), relies on a [small javascript](index.js) file to interface with [puppeteer](https://github.com/GoogleChrome/puppeteer).

In simple terms, `chrome-snapper` uses headless Chrome in a Docker container to visit any URL supplied by the user, take a full-page screenshot of the rendered URL. Any malware or drive-by downloads vanish along with the container when it terminates.

## Usage

```sh
$ docker build -t chrome-snapper -f Dockerfile . # build the image
$ docker run --rm -v $(pwd):/screenshot chrome-snapper <URL>
```

## Demo

![Demo](demo/chrome-snapper.gif)

## Related

- [Chromeshot](https://github.com/tonious/chromeshot) - Screenshot websites using headless Chrome and Docker.
- [chrome-headless-screenshots](https://github.com/schnerd/chrome-headless-screenshots) - Using headless Chrome as an automated screenshot tool.
- [EyeWitness](https://github.com/ChrisTruncer/EyeWitness) - EyeWitness is designed to take screenshots of websites, provide some server header info, and identify default credentials if possible.

## License

MIT &copy; 2017 [Peter Benjamin](https://petermbenjamin.github.io)
