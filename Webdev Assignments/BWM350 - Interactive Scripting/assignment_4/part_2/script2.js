document.addEventListener("DOMContentLoaded", function()
{
    // populate "Browser" area with browser application name
    document.getElementById('browser').innerText = navigator.appName;

    // generate location values and pass them to the showPosition() function
    navigator.geolocation.getCurrentPosition(showPosition);

    // populate "Platform" area with the visiting machine's chipset info
    document.getElementById('platform').innerText = navigator.platform;

    // populate "Engine" area with browser engine info
    document.getElementById('engine').innerText = navigator.product;

    // populate "Aspect ratio" area with viewport dimensions
    document.getElementById('ratio').innerText = 'Width: ' + screen.availWidth + '; Height: ' + screen.availHeight;

    // populate "Color depth" area with color depth info
    document.getElementById('color').innerText = screen.colorDepth;
});

function showPosition(position)
{
    // populate "Location" area with latitude and longitude sourced from line 7
    document.getElementById('location').innerText = 'Latitude: ' + position.coords.latitude.toFixed(3) + '; Longitude: ' + position.coords.longitude.toFixed(3);
}