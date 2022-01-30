CREATE OR REPLACE FUNCTION public.CREATE_OR_UPDATE_ROLE(role_name text, role_password text) RETURNS void AS $$
BEGIN
    IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = role_name) THEN
	   EXECUTE FORMAT('ALTER ROLE "%I" LOGIN PASSWORD ''%s''', role_name, role_password);
    ELSE 
    	EXECUTE FORMAT('CREATE ROLE "%I" LOGIN PASSWORD ''%s''', role_name, role_password);
    END IF;
END
$$
LANGUAGE plpgsql STRICT;
