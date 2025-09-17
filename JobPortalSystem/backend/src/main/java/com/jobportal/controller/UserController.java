package com.jobportal.controller;

import com.jobportal.entity.User;
import com.jobportal.service.AuthService;
import com.jobportal.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@Slf4j
@Tag(name = "Users", description = "User management APIs")
@CrossOrigin(origins = "*", maxAge = 3600)
public class UserController {

    private final UserService userService;
    private final AuthService authService;

    @GetMapping("/profile")
    @Operation(summary = "Get user profile", description = "Get current user's profile")
    public ResponseEntity<?> getUserProfile() {
        try {
            User user = authService.getCurrentUser();
            return ResponseEntity.ok(createUserResponse(user));
        } catch (Exception e) {
            log.error("Failed to get user profile", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to get user profile");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PutMapping("/profile")
    @Operation(summary = "Update user profile", description = "Update current user's profile")
    public ResponseEntity<?> updateUserProfile(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String bio,
            @RequestParam(required = false) String location,
            @RequestParam(required = false) String website,
            @RequestParam(required = false) String linkedinUrl,
            @RequestParam(required = false) String githubUrl) {
        
        try {
            User currentUser = authService.getCurrentUser();
            User updatedUser = userService.updateProfile(currentUser, firstName, lastName, phone, 
                    bio, location, website, linkedinUrl, githubUrl);
            return ResponseEntity.ok(createUserResponse(updatedUser));
        } catch (Exception e) {
            log.error("Failed to update user profile", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to update user profile");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PutMapping("/password")
    @Operation(summary = "Update password", description = "Update user password")
    public ResponseEntity<?> updatePassword(@RequestParam String newPassword) {
        try {
            User currentUser = authService.getCurrentUser();
            userService.updatePassword(currentUser, newPassword);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Password updated successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Failed to update password", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to update password");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PutMapping("/profile-picture")
    @Operation(summary = "Update profile picture", description = "Update user profile picture")
    public ResponseEntity<?> updateProfilePicture(@RequestParam String profilePictureUrl) {
        try {
            User currentUser = authService.getCurrentUser();
            User updatedUser = userService.updateProfilePicture(currentUser, profilePictureUrl);
            return ResponseEntity.ok(createUserResponse(updatedUser));
        } catch (Exception e) {
            log.error("Failed to update profile picture", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to update profile picture");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PutMapping("/resume")
    @Operation(summary = "Update resume", description = "Update user resume")
    public ResponseEntity<?> updateResume(@RequestParam String resumeUrl) {
        try {
            User currentUser = authService.getCurrentUser();
            User updatedUser = userService.updateResume(currentUser, resumeUrl);
            return ResponseEntity.ok(createUserResponse(updatedUser));
        } catch (Exception e) {
            log.error("Failed to update resume", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to update resume");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get user by ID", description = "Get user details by ID")
    public ResponseEntity<?> getUserById(@PathVariable Long id) {
        try {
            User user = userService.findById(id)
                    .orElseThrow(() -> new RuntimeException("User not found"));
            return ResponseEntity.ok(createUserResponse(user));
        } catch (Exception e) {
            log.error("Failed to get user with id: {}", id, e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "User not found");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping
    @Operation(summary = "Get all users", description = "Get list of all users (Admin only)")
    public ResponseEntity<?> getAllUsers() {
        try {
            User currentUser = authService.getCurrentUser();
            if (!currentUser.isAdmin()) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Access denied");
                error.put("message", "Only administrators can access this endpoint");
                return ResponseEntity.badRequest().body(error);
            }
            
            List<User> users = userService.getAllUsers();
            List<Map<String, Object>> userResponses = users.stream()
                    .map(this::createUserResponse)
                    .collect(Collectors.toList());
            return ResponseEntity.ok(userResponses);
        } catch (Exception e) {
            log.error("Failed to get all users", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to get users");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/role/{role}")
    @Operation(summary = "Get users by role", description = "Get users filtered by role")
    public ResponseEntity<?> getUsersByRole(@PathVariable User.Role role) {
        try {
            User currentUser = authService.getCurrentUser();
            if (!currentUser.isAdmin()) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Access denied");
                error.put("message", "Only administrators can access this endpoint");
                return ResponseEntity.badRequest().body(error);
            }
            
            List<User> users = userService.getUsersByRole(role);
            List<Map<String, Object>> userResponses = users.stream()
                    .map(this::createUserResponse)
                    .collect(Collectors.toList());
            return ResponseEntity.ok(userResponses);
        } catch (Exception e) {
            log.error("Failed to get users by role: {}", role, e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to get users by role");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PostMapping("/{id}/verify")
    @Operation(summary = "Verify user", description = "Verify a user account (Admin only)")
    public ResponseEntity<?> verifyUser(@PathVariable Long id) {
        try {
            User currentUser = authService.getCurrentUser();
            if (!currentUser.isAdmin()) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Access denied");
                error.put("message", "Only administrators can verify users");
                return ResponseEntity.badRequest().body(error);
            }
            
            User user = userService.verifyUser(id);
            Map<String, String> response = new HashMap<>();
            response.put("message", "User verified successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Failed to verify user with id: {}", id, e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to verify user");
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    private Map<String, Object> createUserResponse(User user) {
        Map<String, Object> response = new HashMap<>();
        response.put("id", user.getId());
        response.put("firstName", user.getFirstName());
        response.put("lastName", user.getLastName());
        response.put("email", user.getEmail());
        response.put("phone", user.getPhone());
        response.put("role", user.getRole());
        response.put("isActive", user.getIsActive());
        response.put("isVerified", user.getIsVerified());
        response.put("profilePicture", user.getProfilePicture());
        response.put("resumeUrl", user.getResumeUrl());
        response.put("bio", user.getBio());
        response.put("location", user.getLocation());
        response.put("website", user.getWebsite());
        response.put("linkedinUrl", user.getLinkedinUrl());
        response.put("githubUrl", user.getGithubUrl());
        response.put("createdAt", user.getCreatedAt());
        response.put("updatedAt", user.getUpdatedAt());
        return response;
    }
}
