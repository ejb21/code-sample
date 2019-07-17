const SmartyStreetsCore = SmartyStreetsSDK.core;
const Lookup = SmartyStreetsSDK.usAutocomplete.Lookup;

let websiteKey = "1458181676833249";
const credentials = new SmartyStreetsCore.SharedCredentials(websiteKey);

let client = SmartyStreetsCore.buildClient.usAutocomplete(credentials);

$('input.form-control').on('keypress', function(e)
{
    let lookup = new Lookup($(this).val());
    lookup.maxSuggestions = 20;

    client.send(lookup).then(function(resp)
    {
        console.info(resp);
        $('#pnlResults').html('');

        resp.result.map(function(addr)
        {
            $('#pnlResults').prepend(`
                <div class="col-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            ${addr.streetLine}<br>
                            ${addr.city}, ${addr.state}
                        </div>
                    </div>
                </div>
            `);
        });
    });
});