import QtQuick 1.0

Item {
    id: container

    Component.onCompleted: {
        hideAll();
    }

    function hideAll() {
        var i = 0;
        var o = container.children[i];
        while (o !== undefined) {
            if (o.pageName) {
                //o.hide();
                o.visible = false;
            }

            i++;
            o = container.children[i];
        }
    }


    function showPage(page) {

        container.hideAll();

        var i = 0;
        var o = container.children[i];
        while (o !== undefined) {
            if (o.pageName === page) {
                //o.show();
                o.visible = true;
                return;
            }

            i++;
            o = container.children[i];
        }

    }
}
