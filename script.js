document.getElementById('formatButton').addEventListener('click', function() {
    var content = document.getElementById('documentContent').value;
    var lines = content.split('\n');
    var formattedContent = '';

    // 大标题
    var titleRegex = /^(.+)$/;
    var subtitleRegex = /^1、(.+)$/;
    var dateRegex = /\d{4}-\d{2}-\d{2}/;

    lines.forEach(function(line) {
        if (titleRegex.test(line)) {
            formattedContent += '<div class="title">' + line + '</div>';
        } else if (subtitleRegex.test(line)) {
            formattedContent += '<div class="subtitle">' + line + '</div>';
        } else if (dateRegex.test(line)) {
            formattedContent += '<div class="date">' + line + '</div>';
        } else {
            formattedContent += '<p>' + line + '</p>';
        }
    });

    document.getElementById('formattedDocument').innerHTML = formattedContent;
});
