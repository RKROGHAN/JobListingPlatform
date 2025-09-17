import React from 'react';
import { Container, Typography, Box } from '@mui/material';

const ProfilePage: React.FC = () => {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography variant="h3" component="h1" gutterBottom>
        Profile
      </Typography>
      <Box sx={{ mt: 4 }}>
        <Typography variant="body2" color="text.secondary">
          This page will contain user profile management and settings.
        </Typography>
      </Box>
    </Container>
  );
};

export default ProfilePage;
