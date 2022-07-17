create schema if not exists appointment_service;

select create_or_update_role('appointment_service_admin', '${appointment_service_admin_password}');
alter schema appointment_service owner to appointment_service_admin;
alter role appointment_service_admin set search_path to appointment_service;

grant appointment_service_admin to practice_admin;

select create_or_update_role('appointment_service_rw', '${appointment_service_rw_password}');
grant usage on schema appointment_service to appointment_service_rw;

alter role appointment_service_rw set search_path to appointment_service;
alter default privileges for role appointment_service_admin in schema appointment_service grant select on tables to appointment_service_rw;
alter default privileges for role appointment_service_admin in schema appointment_service grant insert on tables to appointment_service_rw;
alter default privileges for role appointment_service_admin in schema appointment_service grant update on tables to appointment_service_rw;
alter default privileges for role appointment_service_admin in schema appointment_service grant delete on tables to appointment_service_rw;
alter default privileges for role appointment_service_admin in schema appointment_service grant select, usage on sequences to appointment_service_rw;

select create_or_update_role('appointment_service_ro', '${appointment_service_ro_password}');
grant usage on schema appointment_service to appointment_service_ro;
alter role appointment_service_ro set search_path to appointment_service;

alter default privileges for role appointment_service_admin in schema appointment_service grant select on tables to appointment_service_ro;
