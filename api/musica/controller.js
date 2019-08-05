let request = require('request');
const fetch = require('node-fetch');
const Spotify = require('node-spotify-api');


const _getMusicas = async (req, res, next) => {

    const city = req.params.city;
    let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=611ad7b47e3d9c595bc9a7713dfd20be&units=metric`;
    let genero = '';
    const response = await fetch(url);
    const body = await response.json();


    if(body.main.temp > 25){
            //pop
        genero = 'pop';
    }else if(body.main.temp >= 10 && body.main.temp <=25 ) {
            //rock
        genero = 'rock';
    }else if(body.main.temp < 10) {
            //clássicas
        genero = 'classica';
    }

    let spotifyTest = new Spotify({
        id: '8d09f7efcf60447da10e7e6768d3469a',
        secret: 'b3b9f21aae3d425da7991a3eae2869dd'
    });

     spotifyTest.search({ type: 'track', query: genero, limit: 10 }, async function(err, data) {
        if (err) {
            return console.log('Error occurred: ' + err);
        }
        return   res.send(JSON.stringify({ success: true, data: data.tracks.items }));
    });

};

const getController = (libs, queries) => ({
    getMusicas: (req, res, next) => _getMusicas(req, res, next),
});

module.exports.getController = getController;