(() => {
    let oQS = (() => {
        var oUrl = {};                                                              // create blank object to store QS data
        document.URL.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {  // for each key/value pair in the QS
            oUrl[key] = decodeURIComponent(value.split('#')[0]);                    // store the map in the oUrl object
        });
        return oUrl;                                                                // return the dictionary of data
    })();


    $(() => {
        if (oQS['name']) {                                                          // if a name is passed
            $('#customer-name')                                                     // find the customer-name element
                .html(oQS['name'])                                                  // set it's HTML to the passed value
                .parent()                                                           // look up to the parent H2
                .removeClass('d-none');                                             // remove the display-none css class
            }
    });
})();

function winWorldSeries()
{
    var rand = Math.random();
    if (rand > .2667) swal('You didn\'t win the World Series. Better luck next year.')
    else swal('Hey!! You won the World Series!')
}

$(document).ready(function()
{
    $('section.intro').css('background-image', 'url("./img/intro-bg.png")');
});