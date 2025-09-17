import React from 'react';
import { Container, Typography, Box } from '@mui/material';

const PostJobPage: React.FC = () => {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography variant="h3" component="h1" gutterBottom>
        Post a Job
      </Typography>
      <Box sx={{ mt: 4 }}>
        <Typography variant="body2" color="text.secondary">
          This page will contain a form to post new job listings.
        </Typography>
      </Box>
    </Container>
  );
};

export default PostJobPage;
