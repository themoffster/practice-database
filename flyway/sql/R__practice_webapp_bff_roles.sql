create schema if not exists practice_webapp_bff;

select create_or_update_role('practice_webapp_bff_admin', '${practice_webapp_bff_admin_password}');
alter schema practice_webapp_bff owner to practice_webapp_bff_admin;
alter role practice_webapp_bff_admin set search_path to practice_webapp_bff;

grant practice_webapp_bff_admin to practice_admin;

select create_or_update_role('practice_webapp_bff_rw', '${practice_webapp_bff_rw_password}');
grant usage on schema practice_webapp_bff to practice_webapp_bff_rw;

alter role practice_webapp_bff_rw set search_path to practice_webapp_bff;
alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant select on tables to practice_webapp_bff_rw;
alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant insert on tables to practice_webapp_bff_rw;
alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant update on tables to practice_webapp_bff_rw;
alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant delete on tables to practice_webapp_bff_rw;
alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant select, usage on sequences to practice_webapp_bff_rw;

select create_or_update_role('practice_webapp_bff_ro', '${practice_webapp_bff_ro_password}');
grant usage on schema practice_webapp_bff to practice_webapp_bff_ro;
alter role practice_webapp_bff_ro set search_path to practice_webapp_bff;

alter default privileges for role practice_webapp_bff_admin in schema practice_webapp_bff grant select on tables to practice_webapp_bff_ro;
