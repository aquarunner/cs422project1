#ifndef VENDORPLUGIN_H
#define VENDORPLUGIN_H

#include <QtDeclarative/QDeclarativeExtensionPlugin>

class VendorPlugin : public QDeclarativeExtensionPlugin
{
    Q_OBJECT

public:
    void registerTypes(const char *uri);
};

#endif // VENDORPLUGIN_H

