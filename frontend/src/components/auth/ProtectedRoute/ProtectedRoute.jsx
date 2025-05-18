import React from 'react';
import { Navigate, Outlet, useLocation } from 'react-router-dom';
import { observer } from 'mobx-react-lite';
import authStore from '../../../stores/authStore';
import { Box, CircularProgress, Typography } from '@mui/material';

const ProtectedRoute = observer(({ allowedRoles }) => {
    const location = useLocation();

    if (authStore.loading && !authStore.isAuthenticated && localStorage.getItem('authToken')) {
        return (
            <Box display="flex" justifyContent="center" alignItems="center" height="100vh">
                <CircularProgress />
                <Typography sx={{ ml: 2 }}>Перевірка автентифікації...</Typography>
            </Box>
        );
    }

    if (!authStore.isAuthenticated) {
        return <Navigate to="/login" state={{ from: location }} replace />;
    }

    if (allowedRoles && allowedRoles.length > 0) {
        const userRole = authStore.userRole;
        if (!userRole || !allowedRoles.includes(userRole)) {
            return (
                <Box sx={{ p: 3, textAlign: 'center' }}>
                    <Typography variant="h5" color="error">Доступ заборонено</Typography>
                    <Typography>У вас недостатньо прав для перегляду цієї сторінки.</Typography>
                </Box>
            );
        }
    }

    return <Outlet />;
});

export default ProtectedRoute;