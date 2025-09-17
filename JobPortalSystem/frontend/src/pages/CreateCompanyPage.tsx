import React from 'react';
import { Container, Typography, Box } from '@mui/material';

const CreateCompanyPage: React.FC = () => {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography variant="h3" component="h1" gutterBottom>
        Create Company
      </Typography>
      <Box sx={{ mt: 4 }}>
        <Typography variant="body2" color="text.secondary">
          This page will contain a form to create a new company profile.
        </Typography>
      </Box>
    </Container>
  );
};

export default CreateCompanyPage;
