Array
    .from(ol.getElementsByTagName('li'))
    .sort(sortBy(li => {
        let text = li.querySelector('.sl-list-column--filename > a')['title'];
        text = text.substr(text.indexOf(' - ') + 3);
        text = text.substr(0, text.indexOf('.'));
        return new Date(text).getTime();
    }))
    .forEach((e,i)=>{
        ol.remove(e);
        ol.appendChild(e);
    });

function sortBy(apply) {
    return (a, b) => apply(a) < apply(b);
}