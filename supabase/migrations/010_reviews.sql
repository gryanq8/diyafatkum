create table public.reviews (
  id uuid primary key default gen_random_uuid(),

  request_id uuid
    references public.requests(id)
    on delete set null,

  customer_id uuid
    references public.profiles(id)
    on delete set null,

  business_id uuid
    references public.provider_businesses(id)
    on delete cascade,

  rating integer not null check (rating between 1 and 5),

  review text,

  created_at timestamptz default now()
);

alter table public.reviews
enable row level security;
