-- Add API keys and preferred API to profiles
ALTER TABLE public.profiles 
  ADD COLUMN IF NOT EXISTS gemini_api_key text,
  ADD COLUMN IF NOT EXISTS grsai_api_key text,
  ADD COLUMN IF NOT EXISTS preferred_api text DEFAULT 'gemini' CHECK (preferred_api IN ('gemini', 'grsai'));

-- Only admins can see/edit API keys
COMMENT ON COLUMN public.profiles.gemini_api_key IS 'Personal Gemini API key assigned by admin';
COMMENT ON COLUMN public.profiles.grsai_api_key IS 'Personal backup API key assigned by admin';
COMMENT ON COLUMN public.profiles.preferred_api IS 'Active API provider: gemini or grsai';
