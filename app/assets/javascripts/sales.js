function openBranch(evt, branchName, toggleView) {
        var i, tabcontent, tablinks;

        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        document.getElementById(branchName).style.display = "block";
        evt.currentTarget.className += " active";
        document.getElementById(toggleView).click();
}

function toggleView(evt, branchName) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("togglecontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

        
    tablinks = document.getElementsByClassName("togglelinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(branchName).style.display = "block";
    evt.currentTarget.className += " active";
    evt.preventDefault();
}
