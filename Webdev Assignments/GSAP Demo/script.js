function asdf()
{
    var tlEo = new TimelineMax(), tlPaps = new TimelineMax(),
        tlFoulkey = new TimelineMax(), tlUe = new TimelineMax();
    var eovaldi = document.getElementsByClassName('eovaldi')[0];
    var papelbon = document.getElementsByClassName('papelbon')[0];
    var foulke = document.getElementsByClassName('foulke')[0];
    var uehara = document.getElementsByClassName('uehara')[0];

    tlEo.to(eovaldi, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '29%',
            transform: 'rotate(10deg)',
            ease: Power1.easeOut
        }).to(eovaldi, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '60%',
            transform: 'rotate(-10deg)',
            ease: Power1.easeOut
        }).to(eovaldi, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '52.5%',
            transform: 'rotate(13deg)',
            ease: Power1.easeOut
        }).to(eovaldi, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '36%',
            transform: 'rotate(-12deg)',
            ease: Power1.easeOut
        }).repeat(-1);

    tlPaps.to(papelbon, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '60%',
            transform: 'rotate(-10deg)',
            ease: Power1.easeOut
        }).to(papelbon, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '52.5%',
            transform: 'rotate(13deg)',
            ease: Power1.easeOut
        }).to(papelbon, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '36%',
            transform: 'rotate(-12deg)',
            ease: Power1.easeOut
        }).to(papelbon, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '29%',
            transform: 'rotate(10deg)',
            ease: Power1.easeOut
        }).repeat(-1);

    tlFoulkey.to(foulke, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '52.5%',
            transform: 'rotate(13deg)',
            ease: Power1.easeOut
        }).to(foulke, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '36%',
            transform: 'rotate(-12deg)',
            ease: Power1.easeOut
        }).to(foulke, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '29%',
            transform: 'rotate(10deg)',
            ease: Power1.easeOut
        }).to(foulke, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '60%',
            transform: 'rotate(-10deg)',
            ease: Power1.easeOut
        }).repeat(-1);

    tlUe.to(uehara, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '36%',
            transform: 'rotate(-12deg)',
            ease: Power1.easeOut
        }).to(uehara, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '29%',
            transform: 'rotate(10deg)',
            ease: Power1.easeOut
        }).to(uehara, 1,
        {
            width: '11.1%',
            zIndex: '4',
            top: '31%',
            left: '60%',
            transform: 'rotate(-10deg)',
            ease: Power1.easeOut
        }).to(uehara, 1,
        {
            width: '9%',
            zIndex: '1',
            top: '31%',
            left: '52.5%',
            transform: 'rotate(13deg)',
            ease: Power1.easeOut
        }).repeat(-1);

    var master = new TimelineMax();
    master.add('start').add(tlEo,'start').add(tlPaps,'start')
        .add(tlFoulkey,'start').add(tlUe,'start');
}



/*
.foulke
{
width: 11.1%;
z-index: 4;
top: 31%;
left: 60%;
transform: rotate(-10deg);
}

.papelbon
{
width: 11.1%;
z-index: 4;
top: 31%;
left: 29%;
transform: rotate(10deg);
}

.uehara
{
width: 9%;
z-index: 1;
top: 31%;
left: 52.5%;
transform: rotate(13deg);
}

.eovaldi
{
width: 9%;
z-index: 1;
top: 31%;
left: 36%;
transform: rotate(-12deg);*/