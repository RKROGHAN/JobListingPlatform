import React from 'react';
import { Container, Typography, Box } from '@mui/material';
import { useParams } from 'react-router-dom';

const CompanyDetailsPage: React.FC = () => {
  const { id } = useParams<{ id: string }>();

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography variant="h3" component="h1" gutterBottom>
        Company Details
      </Typography>
      <Typography variant="body1">
        Company ID: {id}
      </Typography>
      <Box sx={{ mt: 4 }}>
        <Typography variant="body2" color="text.secondary">
          This page will show detailed company information and their job listings.
        </Typography>
      </Box>
    </Container>
  );
};

export default CompanyDetailsPage;
