const base_url = import.meta.env.VITE_BASE_URL;
export const BASE_URL = base_url;

export const UserRoles = [
    {label: 'Адміністратор', value: 'ADMIN'},
    {label: 'Командир частини', value: 'COMMANDER'},
    {label: 'Командир підрозділу', value: 'UNIT_COMMANDER'}
];
