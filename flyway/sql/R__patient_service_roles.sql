create schema if not exists patient_service;

select create_or_update_role('patient_service_admin', '${patient_service_admin_password}');
alter schema patient_service owner to patient_service_admin;
alter role patient_service_admin set search_path to patient_service;

grant patient_service_admin to practice_admin;

select create_or_update_role('patient_service_rw', '${patient_service_rw_password}');
grant usage on schema patient_service to patient_service_rw;

alter role patient_service_rw set search_path to patient_service;
alter default privileges for role patient_service_admin in schema patient_service grant select on tables to patient_service_rw;
alter default privileges for role patient_service_admin in schema patient_service grant insert on tables to patient_service_rw;
alter default privileges for role patient_service_admin in schema patient_service grant update on tables to patient_service_rw;
alter default privileges for role patient_service_admin in schema patient_service grant delete on tables to patient_service_rw;
alter default privileges for role patient_service_admin in schema patient_service grant select, usage on sequences to patient_service_rw;

select create_or_update_role('patient_service_ro', '${patient_service_ro_password}');
grant usage on schema patient_service to patient_service_ro;
alter role patient_service_ro set search_path to patient_service;

alter default privileges for role patient_service_admin in schema patient_service grant select on tables to patient_service_ro;
