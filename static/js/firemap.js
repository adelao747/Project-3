var map = L.map("map").setView([37.773972, -122.431297], 12);

L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

d3.csv('static/data/clean_data.csv').then(function(data){
    var heatLayer;
    function mapYear(){
        if (heatLayer){
            map.removeLayer(heatLayer);
        }
        let selector=d3.select('#selector')
        let dataset=selector.property('value')
        console.log(dataset);
        let currentYearFire=data.filter((fire)=>fire['year']==dataset)//.slice(0, 100);
        let currentYearFireCoords=currentYearFire.map(function(fire){
            return [parseFloat(fire['lat']), parseFloat(fire['lon']), 0.2]
        });

        heatLayer = L.heatLayer(currentYearFireCoords, {radius: 25})
        heatLayer.addTo(map);
        console.log(currentYearFireCoords);
    };

    let select=d3.select('#selector')
    select.on('change', mapYear)
});













