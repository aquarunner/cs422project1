#include "vendorplugin.h"
#include "myitem.h"

#include <QtDeclarative/qdeclarative.h>

void VendorPlugin::registerTypes(const char *uri)
{
    // @uri Custom
    uri = "Custom";
    qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
}

Q_EXPORT_PLUGIN2(VendorPlugin, VendorPlugin)

