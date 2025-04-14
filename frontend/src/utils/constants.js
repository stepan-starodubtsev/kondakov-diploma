const base_url = import.meta.env.VITE_BASE_URL
export const BASE_URL = base_url

export const SERVICE_TO_NUMBER = {
    "VNLZ": 1,
    "SZ": 2
};
export const SERVICES = {
    "1": {'name': 'ВНЛЗ', 'alias': 'vnlz', 'dbValue': 'ВНЛЗ'},
    "2": {'name': "Служба зв'язку", 'alias': 'sz', 'dbValue': 'СЗ'},
};

export const FIELDS = {
    NAME: "найменування",
    INVENTORY_NUMBER: "інвентарний номер",
    YEAR: "рік виготовлення",
    SERIAL: "заводський номер",
}