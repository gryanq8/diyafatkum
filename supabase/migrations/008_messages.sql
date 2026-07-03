create table public.messages (
  id uuid primary key default gen_random_uuid(),

  request_id uuid not null
    references public.requests(id)
    on delete cascade,

  sender_id uuid not null
    references public.profiles(id)
    on delete cascade,

  message text not null,

  is_read boolean default false,

  created_at timestamptz default now()
);

alter table public.messages
enable row level security;
