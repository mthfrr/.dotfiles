// ==UserScript==
// @name     get tags
// @version  1
// @grant    none
// ==/UserScript==

function get_tags()
{
    let els = Array.from(document.getElementsByTagName("vaadin-grid-cell-content"));
    let lines = [];
    for (let i = 0; i < els.length; i += 7) {
        var line = [];
        for (let j = 0; j < 7; j++)
            line.push(els[i+j]);
        lines.push(line);
    }

    lines = lines.filter((val) => {return val[0].innerText == "piscine-2024"});

    function parse_date(d)
    {
        // October 29, 2021; 02:48
        let arr = d.split(/[\s,;:]+/);
        months = {
            "October": 9,
            "November": 10,
            "December": 11
        }
        return new Date(arr[2], months[arr[0]], arr[1], arr[3], arr[4], "0")
    }

    let exos = {};
    for (let i = 0; i < lines.length; i++)
    {
        if (!(lines[i][1].innerText in exos))
        {
            exos[lines[i][1].innerText] = [parse_date(lines[i][3].innerText), lines[i][2].innerText, lines[i][5]];
        }
        else
        {
            if (parse_date(lines[i][3].innerText) > exos[lines[i][1].innerText][0])
                exos[lines[i][1].innerText] = [parse_date(lines[i][3].innerText), lines[i][2].innerText, lines[i][5]];
        }
    }

    var filtered = Object.keys(exos).reduce(function (filtered, key) {
        if (exos[key][2].children[0].children[0].children[0].icon != "vaadin:star")
            filtered[key] = exos[key];
        return filtered;
    }, {});

    // <> Pretty Print <>

    Object.entries(filtered).forEach((val) => {console.log(`${val[1][1]}`)})
}