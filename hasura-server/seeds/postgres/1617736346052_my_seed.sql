INSERT INTO public.groups (id, name, description, created_at, updatedat) VALUES (1, 'Group A', NULL, '2021-04-06 19:08:37.665594', '2021-04-06 19:08:37.665594');
INSERT INTO public.roles (id, name, description, created_at, updatedat) VALUES (1, 'user', 'This is a user role.', '2021-04-06 19:08:22.683544', '2021-04-06 19:08:22.683544');
INSERT INTO public.users (id, username, avatarurl, email, password, accountconfirmed, accountconfirmationtoken, confirmationtokenexpires, resetpasswordtoken, resetpasswordexpires, createdat, updatedat) VALUES (1, 'bob', NULL, 'test@test.co.uk', 'password', false, NULL, NULL, NULL, NULL, '2021-04-06 17:52:40.011048', '2021-04-06 17:52:40.011048');
INSERT INTO public.users_roles (user_id, role_id, created_at) VALUES (1, 1, '2021-04-06 19:08:58.33618');
SELECT pg_catalog.setval('public.groups_id_seq', 1, true);
SELECT pg_catalog.setval('public.roles_id_seq', 1, true);
SELECT pg_catalog.setval('public.users_id_seq', 2, true);
