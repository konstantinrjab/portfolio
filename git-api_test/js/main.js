function deleteRow(i) {
    $('#rule_' + i).remove();
}

function addRow() {
    length = $('.rule').length;
    $('.rule').last().after(
        '<div class="rule" id="rule_'+length+'">\n' +
        '                        <select name="field_' + length + '" id="">\n' +
        '                            <option value="size" selected="selected">size</option>\n' +
        '                            <option value="forks">forks</option>\n' +
        '                            <option value="stars">stars</option>\n' +
        '                            <option value="followers">followers</option>\n' +
        '                        </select>\n' +
        '                        <select name="operator_' + length + '" id="">\n' +
        '                            <option value=">" selected="selected">></option>\n' +
        '                            <option value="<"><</option>\n' +
        '                            <option value="=">=</option>\n' +
        '                        </select>\n' +
        '                        <input type="text" name="value_' + length + '" placeholder="Value">\n' +
        '\n' +
        '                        <button type="button" class="btn btn-danger" onclick="deleteRow('+length+')">Delete</button>\n' +
        '                    </div>'
    );
}