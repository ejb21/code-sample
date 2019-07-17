document.addEventListener("DOMContentLoaded", function()
{
    document.getElementById('convert1Button').addEventListener('click', convertKm);
    document.getElementById('convert2Button').addEventListener('click', convertMi);
});

function convertKm()
{
    var miles = document.getElementById('m1Value').value;

    if (!miles || isNaN(miles))
    {
        alert('Please provide a distance in miles.');
        document.getElementById('m1Value').focus();
        return;
    }

    var kilometers = miles * 1.60934;
    document.getElementById('k1Value').innerText = kilometers.toFixed(2);
}

function convertMi()
{
    var kilometers = document.getElementById('k2Value').value;

    if (!kilometers || isNaN(kilometers))
    {
        alert('Please provide a distance in kilometers.');
        document.getElementById('k2Value').focus();
        return;
    }

    var miles = kilometers / 1.60934;
    document.getElementById('m2Value').innerText = miles.toFixed(2);
}