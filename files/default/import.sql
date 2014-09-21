INSERT INTO `cloud`.`disk_offering` (id, name, uuid, display_text, created, use_local_storage, type, disk_size) VALUES (17, 'Tiny offering', UUID(), 'Tiny offering', NOW(), 1, 'Service', 0);
INSERT INTO `cloud`.`service_offering` (id, cpu, speed, ram_size) VALUES (17, 1, 100, 100);
INSERT INTO `cloud`.`disk_offering` (name, uuid, display_text, created, use_local_storage, type, disk_size) VALUES ('Tiny disk offering', UUID(), 'Tiny disk offering', NOW(), 1, 'Disk', 1073741824);
INSERT INTO `cloud`.`configuration` (category, instance, component, name, value) VALUES ('Advanced', 'DEFAULT', 'management-server', 'integration.api.port', '8096');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','router.ram.size', '100');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','router.cpu.mhz','100');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','console.ram.size','100');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','console.cpu.mhz', '100');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','ssvm.ram.size','100');
INSERT INTO `cloud`.`configuration` (instance, name,value) VALUE('DEFAULT','ssvm.cpu.mhz','100');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'system.vm.use.local.storage', 'true');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'expunge.workers', '3');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'expunge.delay', '60');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'expunge.interval', '60');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'management.network.cidr', '0.0.0.0/0');
INSERT INTO `cloud`.`configuration` (instance, name, value) VALUE('DEFAULT', 'secstorage.allowed.internal.sites', '0.0.0.0/0');
UPDATE `cloud`.`configuration` SET value='10' where name = 'storage.overprovisioning.factor';
UPDATE `cloud`.`configuration` SET value='10' where name = 'cpu.overprovisioning.factor';
UPDATE `cloud`.`configuration` SET value='10' where name = 'mem.overprovisioning.factor';
UPDATE `cloud`.`vm_template` SET unique_name="Debian 7",name="Debian 7",url="http://ianduffy.ie/cloudstack/2GB-debian-wheezy-7.5.0-amd64-xen.1.vhd.bz2",checksum="c5b94a3b1a55a34b4fb6a0eebcc839e9",display_text="Debian 7" where id=5;