-- This SQL statement drops the foreign key constraint named DEPT_MAN_FK from the DEPARTMENTS table.
ALTER TABLE DEPARTMENTS DROP CONSTRAINT DEPT_MAN_FK;

-- This SQL statement drops the REGIONS table and cascades constraints, removing any dependent constraints.
DROP TABLE REGIONS CASCADE CONSTRAINTS;

-- This SQL statement drops the user named EREN and cascades to remove all objects owned by the user.
DROP USER EREN CASCADE;
