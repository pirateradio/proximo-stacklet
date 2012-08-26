# proximo-stacklet

Send outbound traffic from a process through a [Proximo proxy](https://addons.heroku.com/proximo).

## Installation

Install the stacklet into your app:

    cd ~/myapp
    curl http://downloads.proximo.io/proximo-stacklet.tgz | tar xz
    git add bin/proximo vendor/dante
    git commit -m "add proximo stacklet"

## Usage

Modify your Procfile to prepend `bin/proximo` to any command:

    web: bin/proximo bundle exec thin start

By default, the `bin/proximo` wrapper will cause all outbound traffic
from the wrapped process to be sent across the [Proximo proxy](https://addons.heroku.com/proximo) and appear
to come from your static IP.

If you'd like to send a subset of traffic over the proxy, limit
with `PROXIMO_MASK`

    $ heroku config:add PROXIMO_MASK="172.18.32.0/24"

This will cause only connections within 172.18.32.0-172.18.32.255 to be
made through the [Proximo proxy](https://addons.heroku.com/proximo).

## License

This is a fancy wrapper for [Dante](http://www.inet.no/dante/) which is licensed with a BSD/CMU-type [license](ftp://ftp.inet.no/pub/socks/LICENSE).

The rest is licensed MIT.
