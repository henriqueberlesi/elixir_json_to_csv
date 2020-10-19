# Json to CSV Converter

## Installation:
Clone this repository.
Run `docker-compose run --rm phoenix mix deps.get`

Run `docker-compose run --rm phoenix mix ecto.create`

After that, run `docker-compose run --rm phoenix bash`, `cd assets/` and `npm install`.

Run `docker-compose up`.

Now you can visit [`localhost:4000/json-to-csv`](http://localhost:4000/json-to-csv) from your browser.
