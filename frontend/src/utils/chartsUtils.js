export const isDateInCurrentMonth = (dateString) => {
    if (!dateString) return false;
    const date = new Date(dateString);
    const today = new Date();
    return date.getFullYear() === today.getFullYear() && date.getMonth() === today.getMonth();
};

export const aggregateDataForPieChart = (items, keyField) => {
    if (!items || items.length === 0) return [];
    return items.reduce((acc, item) => {
        const value = item[keyField] || 'Не вказано';
        const existing = acc.find(d => d.name === value);
        if (existing) {
            existing.value += 1;
        } else {
            acc.push({ name: value, value: 1 });
        }
        return acc;
    }, []);
};