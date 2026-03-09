-- Добавить пользователя как админа по email
-- Выполнить в Supabase Dashboard → SQL Editor

DO $$
DECLARE
  v_user_id uuid;
BEGIN
  SELECT id INTO v_user_id FROM auth.users WHERE email = '1039574@rambler.ru' LIMIT 1;
  IF v_user_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = v_user_id AND role = 'admin'::app_role) THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (v_user_id, 'admin'::app_role);
    RAISE NOTICE 'Admin role added for 1039574@rambler.ru';
  ELSIF v_user_id IS NULL THEN
    RAISE NOTICE 'User 1039574@rambler.ru not found. Sign up first, then run this script.';
  ELSE
    RAISE NOTICE 'User already has admin role.';
  END IF;
END $$;
