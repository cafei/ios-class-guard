#import "CDOCModule.h"

#import <Foundation/Foundation.h>
#import "CDOCSymtab.h"

@implementation CDOCModule

- (id)init;
{
    if ([super init] == nil)
        return nil;

    version = 0;
    name = nil;
    symtab = nil;

    return self;
}

- (void)dealloc;
{
    [name release];
    [symtab release];

    [super dealloc];
}

- (unsigned long)version;
{
    return version;
}

- (void)setVersion:(unsigned long)aVersion;
{
    version = aVersion;
}

- (NSString *)name;
{
    return name;
}

- (void)setName:(NSString *)newName;
{
    if (newName == name)
        return;

    [name release];
    name = [newName retain];
}

- (CDOCSymtab *)symtab;
{
    return symtab;
}

- (void)setSymtab:(CDOCSymtab *)newSymtab;
{
    if (newSymtab == symtab)
        return;

    [symtab release];
    symtab = [newSymtab retain];
}

- (NSString *)description;
{
    return [NSString stringWithFormat:@"[%@] name: %@, version: %d, symtab: %@", NSStringFromClass([self class]), name, version, symtab];
}

@end