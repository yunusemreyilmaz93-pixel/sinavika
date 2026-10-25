export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];

export type Database = {
  public: {
    Tables: {
      app_settings: {
        Row: {
          key: string;
          updated_at: string;
          value: NonNullable<Json>;
        };
        ComputedFields: never;
        Insert: {
          key: string;
          updated_at?: string;
          value: NonNullable<Json>;
        };
        Update: {
          key?: string;
          updated_at?: string;
          value?: NonNullable<Json>;
        };
        Relationships: [];
      };
      avatar_uploads: {
        Row: {
          bytes: number;
          cleaned_at: string | null;
          created_at: string;
          id: number;
          path: string;
          reason: string | null;
          reviewed_at: string | null;
          reviewed_by: string | null;
          status: string;
          user_id: string;
        };
        ComputedFields: never;
        Insert: never;
        Update: never;
        Relationships: [];
      };
      client_errors: {
        Row: {
          created_at: string;
          detail: string | null;
          id: number;
          message: string;
          path: string | null;
          role: Database["public"]["Enums"]["user_role"] | null;
          shown: string | null;
          user_agent: string | null;
          user_id: string | null;
          version: string | null;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          detail?: string | null;
          id?: never;
          message: string;
          path?: string | null;
          role?: Database["public"]["Enums"]["user_role"] | null;
          shown?: string | null;
          user_agent?: string | null;
          user_id?: string | null;
          version?: string | null;
        };
        Update: {
          created_at?: string;
          detail?: string | null;
          id?: never;
          message?: string;
          path?: string | null;
          role?: Database["public"]["Enums"]["user_role"] | null;
          shown?: string | null;
          user_agent?: string | null;
          user_id?: string | null;
          version?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "client_errors_user_id_fkey";
            columns: ["user_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      invites: {
        Row: {
          code: string;
          created_at: string;
          expires_at: string;
          field: Database["public"]["Enums"]["yks_field"] | null;
          grade: number | null;
          kind: Database["public"]["Enums"]["invite_kind"];
          student_id: string | null;
          student_name: string | null;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"] | null;
          used_at: string | null;
          used_by: string | null;
        };
        ComputedFields: never;
        Insert: {
          code?: string;
          created_at?: string;
          expires_at?: string;
          field?: Database["public"]["Enums"]["yks_field"] | null;
          grade?: number | null;
          kind: Database["public"]["Enums"]["invite_kind"];
          student_id?: string | null;
          student_name?: string | null;
          teacher_id: string;
          track?: Database["public"]["Enums"]["exam_track"] | null;
          used_at?: string | null;
          used_by?: string | null;
        };
        Update: {
          code?: string;
          created_at?: string;
          expires_at?: string;
          field?: Database["public"]["Enums"]["yks_field"] | null;
          grade?: number | null;
          kind?: Database["public"]["Enums"]["invite_kind"];
          student_id?: string | null;
          student_name?: string | null;
          teacher_id?: string;
          track?: Database["public"]["Enums"]["exam_track"] | null;
          used_at?: string | null;
          used_by?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "invites_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "invites_teacher_id_fkey";
            columns: ["teacher_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "invites_used_by_fkey";
            columns: ["used_by"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      message_reads: {
        Row: {
          channel: Database["public"]["Enums"]["message_channel"];
          last_read_at: string;
          student_id: string;
          user_id: string;
        };
        ComputedFields: never;
        Insert: {
          channel: Database["public"]["Enums"]["message_channel"];
          last_read_at?: string;
          student_id: string;
          user_id?: string;
        };
        Update: {
          channel?: Database["public"]["Enums"]["message_channel"];
          last_read_at?: string;
          student_id?: string;
          user_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "message_reads_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "message_reads_user_id_fkey";
            columns: ["user_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      lesson_progress: {
        Row: {
          active_seconds: number;
          sections_seen: number;
          student_id: string;
          topic_id: number;
          updated_at: string;
          videos: Json;
        };
        ComputedFields: never;
        Insert: {
          active_seconds?: number;
          sections_seen?: number;
          student_id: string;
          topic_id: number;
          updated_at?: string;
          videos?: Json;
        };
        Update: {
          active_seconds?: number;
          sections_seen?: number;
          student_id?: string;
          topic_id?: number;
          updated_at?: string;
          videos?: Json;
        };
        Relationships: [
          {
            foreignKeyName: "lesson_progress_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "lesson_progress_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      lesson_answers: {
        Row: {
          answered_at: string;
          attempts: number;
          first_correct: boolean;
          last_correct: boolean;
          question_key: string;
          student_id: string;
          topic_id: number;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          answered_at?: string;
          attempts?: number;
          first_correct: boolean;
          last_correct: boolean;
          question_key: string;
          student_id: string;
          topic_id: number;
          updated_at?: string;
        };
        Update: {
          answered_at?: string;
          attempts?: number;
          first_correct?: boolean;
          last_correct?: boolean;
          question_key?: string;
          student_id?: string;
          topic_id?: number;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "lesson_answers_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "lesson_answers_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      announcements: {
        Row: {
          audience: string;
          body: string;
          created_at: string;
          id: number;
          teacher_id: string;
          title: string;
        };
        ComputedFields: never;
        Insert: {
          audience: string;
          body: string;
          created_at?: string;
          id?: number;
          teacher_id?: string;
          title: string;
        };
        Update: {
          audience?: string;
          body?: string;
          created_at?: string;
          id?: number;
          teacher_id?: string;
          title?: string;
        };
        Relationships: [
          {
            foreignKeyName: "announcements_teacher_id_fkey";
            columns: ["teacher_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      books: {
        Row: {
          author: string | null;
          created_at: string;
          finished_on: string | null;
          id: number;
          started_on: string;
          student_id: string;
          title: string;
          total_pages: number | null;
        };
        ComputedFields: never;
        Insert: {
          author?: string | null;
          created_at?: string;
          finished_on?: string | null;
          id?: number;
          started_on?: string;
          student_id: string;
          title: string;
          total_pages?: number | null;
        };
        Update: {
          author?: string | null;
          created_at?: string;
          finished_on?: string | null;
          id?: number;
          started_on?: string;
          student_id?: string;
          title?: string;
          total_pages?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "books_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      bug_reports: {
        Row: {
          created_at: string;
          id: number;
          images: string[];
          message: string;
          path: string | null;
          reporter_name: string | null;
          role: Database["public"]["Enums"]["user_role"] | null;
          status: string;
          user_agent: string | null;
          user_id: string;
        };
        ComputedFields: never;
        Insert: {
          images?: string[];
          message: string;
          path?: string | null;
          user_agent?: string | null;
        };
        Update: {
          status?: string;
        };
        Relationships: [];
      };
      catalog_books: {
        Row: {
          author: string;
          id: number;
          search: string | null;
          title: string;
        };
        ComputedFields: never;
        Insert: {
          author: string;
          id?: number;
          title: string;
        };
        Update: {
          author?: string;
          id?: number;
          title?: string;
        };
        Relationships: [];
      };
      reading_logs: {
        Row: {
          book_id: number;
          created_at: string;
          id: number;
          pages: number;
          read_on: string;
          student_id: string;
        };
        ComputedFields: never;
        Insert: {
          book_id: number;
          created_at?: string;
          id?: number;
          pages: number;
          read_on?: string;
          student_id: string;
        };
        Update: {
          book_id?: number;
          created_at?: string;
          id?: number;
          pages?: number;
          read_on?: string;
          student_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "reading_logs_book_id_fkey";
            columns: ["book_id"];
            isOneToOne: false;
            referencedRelation: "books";
            referencedColumns: ["id"];
          },
        
          {
            foreignKeyName: "reading_logs_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      student_notes: {
        Row: {
          body: string;
          created_at: string;
          id: number;
          shared: boolean;
          student_id: string;
          title: string;
          topic_id: number | null;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          body: string;
          created_at?: string;
          id?: number;
          shared?: boolean;
          student_id?: string;
          title: string;
          topic_id?: number | null;
          updated_at?: string;
        };
        Update: {
          body?: string;
          created_at?: string;
          id?: number;
          shared?: boolean;
          student_id?: string;
          title?: string;
          topic_id?: number | null;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "student_notes_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        
          {
            foreignKeyName: "student_notes_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      report_links: {
        Row: {
          created_at: string;
          created_by: string;
          expires_at: string;
          id: number;
          label: string | null;
          last_viewed_at: string | null;
          revoked_at: string | null;
          student_id: string;
          token_hash: string;
          view_count: number;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          created_by?: string;
          expires_at: string;
          id?: number;
          label?: string | null;
          last_viewed_at?: string | null;
          revoked_at?: string | null;
          student_id: string;
          token_hash: string;
          view_count?: number;
        };
        Update: {
          created_at?: string;
          created_by?: string;
          expires_at?: string;
          id?: number;
          label?: string | null;
          last_viewed_at?: string | null;
          revoked_at?: string | null;
          student_id?: string;
          token_hash?: string;
          view_count?: number;
        };
        Relationships: [
          {
            foreignKeyName: "report_links_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      universities: {
        Row: {
          city: string | null;
          id: number;
          kind: string;
          name: string;
          short_name: string;
        };
        ComputedFields: never;
        Insert: {
          city?: string | null;
          id: number;
          kind: string;
          name: string;
          short_name: string;
        };
        Update: {
          city?: string | null;
          id?: number;
          kind?: string;
          name?: string;
          short_name?: string;
        };
        Relationships: [];
      };
      programs: {
        Row: {
          city: string | null;
          code: number;
          duration: number | null;
          faculty: string | null;
          group_id: number;
          group_name: string;
          language: string | null;
          name: string;
          scholarship: string | null;
          score_type: string;
          university_id: number;
        };
        ComputedFields: never;
        Insert: {
          city?: string | null;
          code: number;
          duration?: number | null;
          faculty?: string | null;
          group_id: number;
          group_name: string;
          language?: string | null;
          name: string;
          scholarship?: string | null;
          score_type: string;
          university_id: number;
        };
        Update: {
          city?: string | null;
          code?: number;
          duration?: number | null;
          faculty?: string | null;
          group_id?: number;
          group_name?: string;
          language?: string | null;
          name?: string;
          scholarship?: string | null;
          score_type?: string;
          university_id?: number;
        };
        Relationships: [
          {
            foreignKeyName: "programs_university_id_fkey";
            columns: ["university_id"];
            isOneToOne: false;
            referencedRelation: "universities";
            referencedColumns: ["id"];
          },
        ];
      };
      program_results: {
        Row: {
          min_score: number | null;
          nets: Json | null;
          placed: number | null;
          program_code: number;
          quota: number | null;
          rank: number | null;
          year: number;
        };
        ComputedFields: never;
        Insert: {
          min_score?: number | null;
          nets?: Json | null;
          placed?: number | null;
          program_code: number;
          quota?: number | null;
          rank?: number | null;
          year: number;
        };
        Update: {
          min_score?: number | null;
          nets?: Json | null;
          placed?: number | null;
          program_code?: number;
          quota?: number | null;
          rank?: number | null;
          year?: number;
        };
        Relationships: [
          {
            foreignKeyName: "program_results_program_code_fkey";
            columns: ["program_code"];
            isOneToOne: false;
            referencedRelation: "programs";
            referencedColumns: ["code"];
          },
        ];
      };
      lesson_notes: {
        Row: {
          body: string;
          topic_id: number;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          body?: string;
          topic_id: number;
          updated_at?: string;
        };
        Update: {
          body?: string;
          topic_id?: number;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "lesson_notes_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: true;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      lessons: {
        Row: {
          body: string;
          created_at: string;
          published: boolean;
          published_at: string | null;
          reading_minutes: number;
          topic_id: number;
          updated_at: string;
          updated_by: string | null;
        };
        ComputedFields: never;
        Insert: {
          body?: string;
          created_at?: string;
          published?: boolean;
          published_at?: string | null;
          reading_minutes?: number;
          topic_id: number;
          updated_at?: string;
          updated_by?: string | null;
        };
        Update: {
          body?: string;
          created_at?: string;
          published?: boolean;
          published_at?: string | null;
          reading_minutes?: number;
          topic_id?: number;
          updated_at?: string;
          updated_by?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "lessons_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: true;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "lessons_updated_by_fkey";
            columns: ["updated_by"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      messages: {
        Row: {
          body: string;
          channel: Database["public"]["Enums"]["message_channel"];
          created_at: string;
          id: number;
          sender_id: string;
          student_id: string;
        };
        ComputedFields: never;
        Insert: {
          body: string;
          channel: Database["public"]["Enums"]["message_channel"];
          created_at?: string;
          id?: never;
          sender_id?: string;
          student_id: string;
        };
        Update: {
          body?: string;
          channel?: Database["public"]["Enums"]["message_channel"];
          created_at?: string;
          id?: never;
          sender_id?: string;
          student_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "messages_sender_id_fkey";
            columns: ["sender_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "messages_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      mock_exam_answers: {
        Row: {
          answer: string | null;
          key: string | null;
          mock_exam_id: number;
          number: number;
          subject_id: string;
          topic_id: number | null;
        };
        ComputedFields: never;
        Insert: {
          answer?: string | null;
          key?: string | null;
          mock_exam_id: number;
          number: number;
          subject_id: string;
          topic_id?: number | null;
        };
        Update: {
          answer?: string | null;
          key?: string | null;
          mock_exam_id?: number;
          number?: number;
          subject_id?: string;
          topic_id?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "mock_exam_answers_mock_exam_id_fkey";
            columns: ["mock_exam_id"];
            isOneToOne: false;
            referencedRelation: "mock_exams";
            referencedColumns: ["id"];
          },
        ];
      };
      student_preferences: {
        Row: {
          created_at: string;
          position: number;
          program_code: number;
          student_id: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          position?: number;
          program_code: number;
          student_id: string;
        };
        Update: {
          created_at?: string;
          position?: number;
          program_code?: number;
          student_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "student_preferences_program_code_fkey";
            columns: ["program_code"];
            isOneToOne: false;
            referencedRelation: "programs";
            referencedColumns: ["code"];
          },
          {
            foreignKeyName: "student_preferences_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      mock_exam_topic_misses: {
        Row: {
          misses: number;
          mock_exam_id: number;
          topic_id: number;
        };
        ComputedFields: never;
        Insert: {
          misses: number;
          mock_exam_id: number;
          topic_id: number;
        };
        Update: {
          misses?: number;
          mock_exam_id?: number;
          topic_id?: number;
        };
        Relationships: [
          {
            foreignKeyName: "mock_exam_topic_misses_mock_exam_id_fkey";
            columns: ["mock_exam_id"];
            isOneToOne: false;
            referencedRelation: "mock_exams";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "mock_exam_topic_misses_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      mock_exam_scores: {
        Row: {
          blank: number;
          correct: number;
          mock_exam_id: number;
          subject_id: string;
          wrong: number;
        };
        ComputedFields: never;
        Insert: {
          blank?: number;
          correct?: number;
          mock_exam_id: number;
          subject_id: string;
          wrong?: number;
        };
        Update: {
          blank?: number;
          correct?: number;
          mock_exam_id?: number;
          subject_id?: string;
          wrong?: number;
        };
        Relationships: [
          {
            foreignKeyName: "mock_exam_scores_mock_exam_id_fkey";
            columns: ["mock_exam_id"];
            isOneToOne: false;
            referencedRelation: "mock_exam_results";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "mock_exam_scores_mock_exam_id_fkey";
            columns: ["mock_exam_id"];
            isOneToOne: false;
            referencedRelation: "mock_exams";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "mock_exam_scores_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
        ];
      };
      mock_exams: {
        Row: {
          created_at: string;
          created_by: string | null;
          id: number;
          kind: Database["public"]["Enums"]["exam_kind"];
          student_id: string;
          taken_on: string;
          title: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          created_by?: string | null;
          id?: never;
          kind: Database["public"]["Enums"]["exam_kind"];
          student_id: string;
          taken_on?: string;
          title: string;
        };
        Update: {
          created_at?: string;
          created_by?: string | null;
          id?: never;
          kind?: Database["public"]["Enums"]["exam_kind"];
          student_id?: string;
          taken_on?: string;
          title?: string;
        };
        Relationships: [
          {
            foreignKeyName: "mock_exams_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "mock_exams_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      notes: {
        Row: {
          body: string;
          created_at: string;
          id: number;
          kind: Database["public"]["Enums"]["note_kind"];
          met_on: string | null;
          student_id: string;
          teacher_id: string;
          updated_at: string;
          visibility: Database["public"]["Enums"]["note_visibility"];
        };
        ComputedFields: never;
        Insert: {
          body: string;
          created_at?: string;
          id?: never;
          kind?: Database["public"]["Enums"]["note_kind"];
          met_on?: string | null;
          student_id: string;
          teacher_id?: string;
          updated_at?: string;
          visibility?: Database["public"]["Enums"]["note_visibility"];
        };
        Update: {
          body?: string;
          created_at?: string;
          id?: never;
          kind?: Database["public"]["Enums"]["note_kind"];
          met_on?: string | null;
          student_id?: string;
          teacher_id?: string;
          updated_at?: string;
          visibility?: Database["public"]["Enums"]["note_visibility"];
        };
        Relationships: [
          {
            foreignKeyName: "notes_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "notes_teacher_id_fkey";
            columns: ["teacher_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      notifications: {
        Row: {
          body: string | null;
          created_at: string;
          dedupe_key: string | null;
          id: number;
          kind: string;
          link: string | null;
          pushed_at: string | null;
          read_at: string | null;
          title: string;
          user_id: string;
        };
        ComputedFields: never;
        Insert: {
          body?: string | null;
          created_at?: string;
          dedupe_key?: string | null;
          id?: never;
          kind: string;
          link?: string | null;
          read_at?: string | null;
          title: string;
          user_id: string;
        };
        Update: {
          body?: string | null;
          created_at?: string;
          dedupe_key?: string | null;
          id?: never;
          kind?: string;
          link?: string | null;
          read_at?: string | null;
          title?: string;
          user_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "notifications_user_id_fkey";
            columns: ["user_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      parent_links: {
        Row: {
          created_at: string;
          parent_id: string;
          student_id: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          parent_id: string;
          student_id: string;
        };
        Update: {
          created_at?: string;
          parent_id?: string;
          student_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "parent_links_parent_id_fkey";
            columns: ["parent_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "parent_links_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      plan_templates: {
        Row: {
          created_at: string;
          description: string | null;
          id: number;
          items: NonNullable<Json>;
          name: string;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"] | null;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          description?: string | null;
          id?: never;
          items?: NonNullable<Json>;
          name: string;
          teacher_id?: string;
          track?: Database["public"]["Enums"]["exam_track"] | null;
          updated_at?: string;
        };
        Update: {
          created_at?: string;
          description?: string | null;
          id?: never;
          items?: NonNullable<Json>;
          name?: string;
          teacher_id?: string;
          track?: Database["public"]["Enums"]["exam_track"] | null;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "plan_templates_teacher_id_fkey";
            columns: ["teacher_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      profiles: {
        Row: {
          accent: string | null;
          application_note: string | null;
          avatar: string | null;
          approved_at: string | null;
          branch: string | null;
          consent_at: string | null;
          created_at: string;
          email: string | null;
          full_name: string;
          id: string;
          is_admin: boolean;
          is_test: boolean;
          last_seen_at: string | null;
          role: Database["public"]["Enums"]["user_role"];
          school: string | null;
          status: Database["public"]["Enums"]["account_status"];
          username: string | null;
        };
        ComputedFields: never;
        Insert: {
          accent?: string | null;
          avatar?: string | null;
          application_note?: string | null;
          approved_at?: string | null;
          branch?: string | null;
          consent_at?: string | null;
          created_at?: string;
          email?: string | null;
          full_name: string;
          id: string;
          is_admin?: boolean;
          is_test?: boolean;
          last_seen_at?: string | null;
          role: Database["public"]["Enums"]["user_role"];
          school?: string | null;
          status?: Database["public"]["Enums"]["account_status"];
          username?: string | null;
        };
        Update: {
          accent?: string | null;
          avatar?: string | null;
          application_note?: string | null;
          approved_at?: string | null;
          branch?: string | null;
          consent_at?: string | null;
          created_at?: string;
          email?: string | null;
          full_name?: string;
          id?: string;
          is_admin?: boolean;
          is_test?: boolean;
          last_seen_at?: string | null;
          role?: Database["public"]["Enums"]["user_role"];
          school?: string | null;
          status?: Database["public"]["Enums"]["account_status"];
          username?: string | null;
        };
        Relationships: [];
      };
      push_subscriptions: {
        Row: {
          auth: string;
          created_at: string;
          endpoint: string;
          p256dh: string;
          user_id: string;
        };
        ComputedFields: never;
        Insert: {
          auth: string;
          created_at?: string;
          endpoint: string;
          p256dh: string;
          user_id?: string;
        };
        Update: {
          auth?: string;
          created_at?: string;
          endpoint?: string;
          p256dh?: string;
          user_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "push_subscriptions_user_id_fkey";
            columns: ["user_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      question_logs: {
        Row: {
          blank: number;
          correct: number;
          created_at: string;
          id: number;
          solved_on: string;
          student_id: string;
          subject_id: string;
          topic_id: number | null;
          wrong: number;
        };
        ComputedFields: never;
        Insert: {
          blank?: number;
          correct?: number;
          created_at?: string;
          id?: never;
          solved_on?: string;
          student_id: string;
          subject_id: string;
          topic_id?: number | null;
          wrong?: number;
        };
        Update: {
          blank?: number;
          correct?: number;
          created_at?: string;
          id?: never;
          solved_on?: string;
          student_id?: string;
          subject_id?: string;
          topic_id?: number | null;
          wrong?: number;
        };
        Relationships: [
          {
            foreignKeyName: "question_logs_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "question_logs_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "question_logs_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      student_goals: {
        Row: {
          kind: Database["public"]["Enums"]["exam_kind"];
          student_id: string;
          target_net: number;
        };
        ComputedFields: never;
        Insert: {
          kind: Database["public"]["Enums"]["exam_kind"];
          student_id: string;
          target_net: number;
        };
        Update: {
          kind?: Database["public"]["Enums"]["exam_kind"];
          student_id?: string;
          target_net?: number;
        };
        Relationships: [
          {
            foreignKeyName: "student_goals_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
      question_sets: {
        Row: {
          id: number;
          exam: Database["public"]["Enums"]["exam_kind"];
          kind: string;
          subject_id: string | null;
          topic_id: number | null;
          title: string;
          duration_min: number | null;
          sort: number;
          published: boolean;
          created_at: string;
        };
        ComputedFields: never;
        Insert: {
          id?: never;
          exam: Database["public"]["Enums"]["exam_kind"];
          kind: string;
          subject_id?: string | null;
          topic_id?: number | null;
          title: string;
          duration_min?: number | null;
          sort?: number;
          published?: boolean;
          created_at?: string;
        };
        Update: {
          id?: never;
          exam?: Database["public"]["Enums"]["exam_kind"];
          kind?: string;
          subject_id?: string | null;
          topic_id?: number | null;
          title?: string;
          duration_min?: number | null;
          sort?: number;
          published?: boolean;
          created_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "question_sets_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "question_sets_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          }
        ];
      };
      questions: {
        Row: {
          id: number;
          set_id: number;
          position: number;
          subject_id: string;
          topic_id: number | null;
          stem: string;
          options: string[];
          correct: number;
          explanation: string;
          difficulty: number;
        };
        ComputedFields: never;
        Insert: {
          id?: never;
          set_id: number;
          position: number;
          subject_id: string;
          topic_id?: number | null;
          stem: string;
          options: string[];
          correct: number;
          explanation?: string;
          difficulty?: number;
        };
        Update: {
          id?: never;
          set_id?: number;
          position?: number;
          subject_id?: string;
          topic_id?: number | null;
          stem?: string;
          options?: string[];
          correct?: number;
          explanation?: string;
          difficulty?: number;
        };
        Relationships: [
          {
            foreignKeyName: "questions_set_id_fkey";
            columns: ["set_id"];
            isOneToOne: false;
            referencedRelation: "question_sets";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "questions_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "questions_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          }
        ];
      };
      students: {
        Row: {
          archived_at: string | null;
          created_at: string;
          daily_minutes_goal: number;
          field: Database["public"]["Enums"]["yks_field"] | null;
          grade: number;
          id: string;
          target: string | null;
          target_program: number | null;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"];
          weekly_questions_goal: number;
        };
        ComputedFields: never;
        Insert: {
          archived_at?: string | null;
          created_at?: string;
          daily_minutes_goal?: number;
          field?: Database["public"]["Enums"]["yks_field"] | null;
          grade: number;
          id: string;
          target?: string | null;
          target_program?: number | null;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"];
          weekly_questions_goal?: number;
        };
        Update: {
          archived_at?: string | null;
          created_at?: string;
          daily_minutes_goal?: number;
          field?: Database["public"]["Enums"]["yks_field"] | null;
          grade?: number;
          id?: string;
          target?: string | null;
          target_program?: number | null;
          teacher_id?: string;
          track?: Database["public"]["Enums"]["exam_track"];
          weekly_questions_goal?: number;
        };
        Relationships: [
          {
            foreignKeyName: "students_id_fkey";
            columns: ["id"];
            isOneToOne: true;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "students_teacher_id_fkey";
            columns: ["teacher_id"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
        ];
      };
      study_sessions: {
        Row: {
          created_at: string;
          id: number;
          minutes: number;
          source: string;
          student_id: string;
          studied_on: string;
          subject_id: string | null;
          topic_id: number | null;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          id?: never;
          minutes: number;
          source?: string;
          student_id: string;
          studied_on?: string;
          subject_id?: string | null;
          topic_id?: number | null;
        };
        Update: {
          created_at?: string;
          id?: never;
          minutes?: number;
          source?: string;
          student_id?: string;
          studied_on?: string;
          subject_id?: string | null;
          topic_id?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "study_sessions_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "study_sessions_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "study_sessions_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      subjects: {
        Row: {
          color: string;
          exam: Database["public"]["Enums"]["exam_kind"];
          fields: Database["public"]["Enums"]["yks_field"][] | null;
          id: string;
          name: string;
          question_count: number;
          short: string;
          sort: number;
        };
        ComputedFields: never;
        Insert: {
          color?: string;
          exam: Database["public"]["Enums"]["exam_kind"];
          fields?: Database["public"]["Enums"]["yks_field"][] | null;
          id: string;
          name: string;
          question_count: number;
          short: string;
          sort?: number;
        };
        Update: {
          color?: string;
          exam?: Database["public"]["Enums"]["exam_kind"];
          fields?: Database["public"]["Enums"]["yks_field"][] | null;
          id?: string;
          name?: string;
          question_count?: number;
          short?: string;
          sort?: number;
        };
        Relationships: [];
      };
      tasks: {
        Row: {
          created_at: string;
          created_by: string | null;
          done_at: string | null;
          due_on: string;
          id: number;
          kind: Database["public"]["Enums"]["task_kind"];
          note: string | null;
          sort: number;
          student_id: string;
          subject_id: string | null;
          target_minutes: number | null;
          target_questions: number | null;
          title: string;
          video_id: string | null;
          video_seconds: number | null;
          video_title: string | null;
          topic_id: number | null;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          created_by?: string | null;
          done_at?: string | null;
          due_on: string;
          id?: never;
          kind?: Database["public"]["Enums"]["task_kind"];
          note?: string | null;
          sort?: number;
          student_id: string;
          subject_id?: string | null;
          target_minutes?: number | null;
          target_questions?: number | null;
          title: string;
          video_id?: string | null;
          video_seconds?: number | null;
          video_title?: string | null;
          topic_id?: number | null;
        };
        Update: {
          created_at?: string;
          created_by?: string | null;
          done_at?: string | null;
          due_on?: string;
          id?: never;
          kind?: Database["public"]["Enums"]["task_kind"];
          note?: string | null;
          sort?: number;
          student_id?: string;
          subject_id?: string | null;
          target_minutes?: number | null;
          target_questions?: number | null;
          title?: string;
          video_id?: string | null;
          video_seconds?: number | null;
          video_title?: string | null;
          topic_id?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "tasks_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "tasks_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "tasks_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "tasks_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      topic_progress: {
        Row: {
          status: Database["public"]["Enums"]["topic_status"];
          student_id: string;
          topic_id: number;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          status: Database["public"]["Enums"]["topic_status"];
          student_id: string;
          topic_id: number;
          updated_at?: string;
        };
        Update: {
          status?: Database["public"]["Enums"]["topic_status"];
          student_id?: string;
          topic_id?: number;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "topic_progress_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "topic_progress_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      test_attempts: {
        Row: {
          id: number;
          student_id: string;
          set_id: number;
          correct: number;
          wrong: number;
          blank: number;
          seconds: number | null;
          created_at: string;
        };
        ComputedFields: never;
        Insert: {
          id?: never;
          student_id: string;
          set_id: number;
          correct: number;
          wrong: number;
          blank: number;
          seconds?: number | null;
          created_at?: string;
        };
        Update: {
          id?: never;
          student_id?: string;
          set_id?: number;
          correct?: number;
          wrong?: number;
          blank?: number;
          seconds?: number | null;
          created_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "test_attempts_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "test_attempts_set_id_fkey";
            columns: ["set_id"];
            isOneToOne: false;
            referencedRelation: "question_sets";
            referencedColumns: ["id"];
          }
        ];
      };
      test_answers: {
        Row: {
          attempt_id: number;
          question_id: number;
          choice: number | null;
          is_correct: boolean;
        };
        ComputedFields: never;
        Insert: {
          attempt_id: number;
          question_id: number;
          choice?: number | null;
          is_correct: boolean;
        };
        Update: {
          attempt_id?: number;
          question_id?: number;
          choice?: number | null;
          is_correct?: boolean;
        };
        Relationships: [
          {
            foreignKeyName: "test_answers_attempt_id_fkey";
            columns: ["attempt_id"];
            isOneToOne: false;
            referencedRelation: "test_attempts";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "test_answers_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          }
        ];
      };
      topics: {
        Row: {
          id: number;
          name: string;
          sort: number;
          subject_id: string;
        };
        ComputedFields: never;
        Insert: {
          id?: never;
          name: string;
          sort?: number;
          subject_id: string;
        };
        Update: {
          id?: never;
          name?: string;
          sort?: number;
          subject_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "topics_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
        ];
      };
      video_progress: {
        Row: {
          buckets: number[];
          completed_at: string | null;
          duration_seconds: number;
          first_seen_at: string;
          max_rate: number;
          position_seconds: number;
          sessions: number;
          student_id: string;
          task_id: number;
          updated_at: string;
          watched_seconds: number;
        };
        ComputedFields: never;
        Insert: {
          buckets?: number[];
          completed_at?: string | null;
          duration_seconds?: number;
          first_seen_at?: string;
          max_rate?: number;
          position_seconds?: number;
          sessions?: number;
          student_id: string;
          task_id: number;
          updated_at?: string;
          watched_seconds?: number;
        };
        Update: {
          buckets?: number[];
          completed_at?: string | null;
          duration_seconds?: number;
          first_seen_at?: string;
          max_rate?: number;
          position_seconds?: number;
          sessions?: number;
          student_id?: string;
          task_id?: number;
          updated_at?: string;
          watched_seconds?: number;
        };
        Relationships: [
          {
            foreignKeyName: "video_progress_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "video_progress_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: true;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      wrong_questions: {
        Row: {
          box: number;
          created_at: string;
          created_by: string | null;
          id: number;
          last_reviewed_at: string | null;
          lapses: number;
          learned_at: string | null;
          next_review_on: string;
          note: string | null;
          photo_path: string | null;
          review_count: number;
          source: string | null;
          student_id: string;
          subject_id: string;
          topic_id: number | null;
        };
        ComputedFields: never;
        Insert: {
          box?: number;
          created_at?: string;
          created_by?: string | null;
          id?: never;
          last_reviewed_at?: string | null;
          lapses?: number;
          learned_at?: string | null;
          next_review_on?: string;
          note?: string | null;
          photo_path?: string | null;
          review_count?: number;
          source?: string | null;
          student_id: string;
          subject_id: string;
          topic_id?: number | null;
        };
        Update: {
          box?: number;
          created_at?: string;
          created_by?: string | null;
          id?: never;
          last_reviewed_at?: string | null;
          lapses?: number;
          learned_at?: string | null;
          next_review_on?: string;
          note?: string | null;
          photo_path?: string | null;
          review_count?: number;
          source?: string | null;
          student_id?: string;
          subject_id?: string;
          topic_id?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "wrong_questions_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "profiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "wrong_questions_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "wrong_questions_subject_id_fkey";
            columns: ["subject_id"];
            isOneToOne: false;
            referencedRelation: "subjects";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "wrong_questions_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Views: {
      mock_exam_results: {
        Row: {
          blank: number | null;
          correct: number | null;
          created_at: string | null;
          id: number | null;
          kind: Database["public"]["Enums"]["exam_kind"] | null;
          net: number | null;
          student_id: string | null;
          taken_on: string | null;
          title: string | null;
          wrong: number | null;
        };
        ComputedFields: never;
        Relationships: [
          {
            foreignKeyName: "mock_exams_student_id_fkey";
            columns: ["student_id"];
            isOneToOne: false;
            referencedRelation: "students";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Functions: {
      admin_book_suggestions: {
        Args: Record<PropertyKey, never>;
        Returns: { author: string; created_at: string; id: number; title: string; votes: number }[];
      };
      review_book_suggestion: {
        Args: { p_approve: boolean; p_author?: string; p_id: number; p_title?: string };
        Returns: undefined;
      };
      admin_test_accounts: {
        Args: Record<PropertyKey, never>;
        Returns: {
          created_at: string;
          environment: string;
          full_name: string;
          id: string;
          role: Database["public"]["Enums"]["user_role"];
        }[];
      };
      search_catalog_books: {
        Args: { p_query: string };
        Returns: { author: string; id: number; title: string }[];
      };
      save_exam_answers: {
        Args: { p_exam_id: number; p_rows: Json; p_subject_id: string };
        Returns: undefined;
      };
      create_report_link: {
        Args: { p_days: number; p_label?: string; p_student: string };
        Returns: string;
      };
      revoke_report_link: {
        Args: { p_id: number };
        Returns: undefined;
      };
      report_by_token: {
        Args: { p_token: string };
        Returns: Json;
      };
      record_lesson_progress: {
        Args: { p_sections: number; p_seconds: number; p_topic: number; p_videos: Json };
        Returns: undefined;
      };
      lesson_completion: {
        Args: { p_student: string; p_topic?: number };
        Returns: {
          complete: boolean;
          reading_ok: boolean;
          reading_pct: number;
          test_answered: number;
          test_first: number;
          test_now: number;
          test_ok: boolean;
          test_total: number;
          topic_id: number;
          video_count: number;
          video_ok: boolean;
          video_pct: number;
        }[];
      };
      preview_set: {
        Args: { p_set: number };
        Returns: Json;
      };
      submit_test: {
        Args: { p_answers: Json; p_seconds?: number; p_set: number };
        Returns: Json;
      };
      test_review: {
        Args: { p_attempt: number };
        Returns: Json;
      };
      answer_lesson_question: {
        Args: { p_correct: boolean; p_key: string; p_topic: number };
        Returns: {
          answered_at: string;
          attempts: number;
          first_correct: boolean;
          last_correct: boolean;
          question_key: string;
          student_id: string;
          topic_id: number;
          updated_at: string;
        };
      };
      admin_site_stats: { Args: { p_days?: number }; Returns: Json };
      admin_usage: { Args: { p_days?: number }; Returns: Json };
      admin_usage_sessions: {
        Args: { p_user: string };
        Returns: { started_at: string; last_ping_at: string; seconds: number; last_path: string | null }[];
      };
      admin_usage_users: {
        Args: { p_days?: number };
        Returns: {
          id: string;
          full_name: string;
          role: Database["public"]["Enums"]["user_role"];
          last_seen_at: string;
          sessions: number;
          seconds: number;
          avg_seconds: number;
          first_seen_at: string;
        }[];
      };
      usage_ping: { Args: { p_path: string }; Returns: undefined };
      admin_avatar_uploads: {
        Args: Record<PropertyKey, never>;
        Returns: {
          id: number;
          user_id: string;
          full_name: string;
          role: Database["public"]["Enums"]["user_role"];
          path: string;
          status: string;
          reason: string | null;
          reviewed_by: string | null;
          created_at: string;
        }[];
      };
      admin_review_avatar: { Args: { p_id: number; p_approve: boolean }; Returns: undefined };
      student_milestones: { Args: { p_student?: string }; Returns: Json };
      set_avatar_preset: { Args: { p_preset: string | null }; Returns: undefined };
      admin_overview: {
        Args: Record<PropertyKey, never>;
        Returns: {
          parents: number;
          sessions_7d: number;
          students_active: number;
          teachers_active: number;
          teachers_pending: number;
        }[];
      };
      admin_teachers: {
        Args: Record<PropertyKey, never>;
        Returns: {
          application_note: string;
          approved_at: string;
          branch: string;
          created_at: string;
          email: string;
          full_name: string;
          id: string;
          is_admin: boolean;
          last_seen_at: string;
          school: string;
          status: Database["public"]["Enums"]["account_status"];
          student_count: number;
        }[];
      };
      create_mock_exam: {
        Args: {
          p_kind: Database["public"]["Enums"]["exam_kind"];
          p_scores: Json;
          p_student_id: string;
          p_taken_on: string;
          p_title: string;
        };
        Returns: number;
      };
      create_parent_invite: {
        Args: { p_student_id: string };
        Returns: {
          code: string;
          created_at: string;
          expires_at: string;
          field: Database["public"]["Enums"]["yks_field"] | null;
          grade: number | null;
          kind: Database["public"]["Enums"]["invite_kind"];
          student_id: string | null;
          student_name: string | null;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"] | null;
          used_at: string | null;
          used_by: string | null;
        };
        SetofOptions: {
          from: "*";
          to: "invites";
          isOneToOne: true;
          isSetofReturn: false;
        };
      };
      create_student_invite: {
        Args: {
          p_field?: Database["public"]["Enums"]["yks_field"];
          p_grade: number;
          p_student_name: string;
          p_track: Database["public"]["Enums"]["exam_track"];
        };
        Returns: {
          code: string;
          created_at: string;
          expires_at: string;
          field: Database["public"]["Enums"]["yks_field"] | null;
          grade: number | null;
          kind: Database["public"]["Enums"]["invite_kind"];
          student_id: string | null;
          student_name: string | null;
          teacher_id: string;
          track: Database["public"]["Enums"]["exam_track"] | null;
          used_at: string | null;
          used_by: string | null;
        };
        SetofOptions: {
          from: "*";
          to: "invites";
          isOneToOne: true;
          isSetofReturn: false;
        };
      };
      link_parent: { Args: { p_code: string }; Returns: undefined };
      log_client_error: {
        Args: {
          p_detail: string | null;
          p_message: string;
          p_path: string | null;
          p_shown: string | null;
          p_user_agent: string | null;
          p_version: string | null;
        };
        Returns: undefined;
      };
      preview_invite: {
        Args: { p_code: string };
        Returns: {
          field: Database["public"]["Enums"]["yks_field"];
          grade: number;
          kind: Database["public"]["Enums"]["invite_kind"];
          student_name: string;
          teacher_name: string;
          track: Database["public"]["Enums"]["exam_track"];
        }[];
      };
      redeem_invite: {
        Args: { p_code: string; p_full_name: string; p_user: string; p_username: string };
        Returns: Database["public"]["Enums"]["user_role"];
      };
      register_teacher: {
        Args: {
          p_admin: boolean;
          p_branch: string;
          p_email: string;
          p_full_name: string;
          p_note: string;
          p_school: string;
          p_user: string;
        };
        Returns: Database["public"]["Enums"]["account_status"];
      };
      review_wrong_result: {
        Args: { p_id: number; p_result: string };
        Returns: {
          box: number;
          created_at: string;
          created_by: string | null;
          id: number;
          lapses: number;
          last_reviewed_at: string | null;
          learned_at: string | null;
          next_review_on: string;
          note: string | null;
          photo_path: string | null;
          review_count: number;
          source: string | null;
          student_id: string;
          subject_id: string;
          topic_id: number | null;
        };
      };
      review_wrong_question: {
        Args: { p_id: number; p_learned: boolean };
        Returns: Database["public"]["Tables"]["wrong_questions"]["Row"];
      };
      save_video_progress: {
        Args: {
          p_duration: number;
          p_new_session: boolean;
          p_position: number;
          p_rate: number;
          p_task: number;
          p_watched: number[];
        };
        Returns: Database["public"]["Tables"]["video_progress"]["Row"];
      };
      set_teacher_status: {
        Args: { p_status: Database["public"]["Enums"]["account_status"]; p_teacher: string };
        Returns: undefined;
      };
      teacher_overview: {
        Args: Record<PropertyKey, never>;
        Returns: {
          archived_at: string;
          field: Database["public"]["Enums"]["yks_field"];
          full_name: string;
          grade: number;
          id: string;
          last_activity_on: string;
          last_exam_kind: Database["public"]["Enums"]["exam_kind"];
          last_net: number;
          last_seen_at: string;
          minutes_7d: number;
          parent_count: number;
          prev_net: number;
          questions_7d: number;
          target: string;
          tasks_overdue: number;
          tasks_week: number;
          tasks_week_done: number;
          track: Database["public"]["Enums"]["exam_track"];
          username: string;
        }[];
      };
      touch_last_seen: { Args: Record<PropertyKey, never>; Returns: undefined };
    };
    Enums: {
      account_status: "pending" | "active" | "rejected" | "disabled";
      exam_kind: "LGS" | "TYT" | "AYT" | "YDT";
      exam_track: "lgs" | "yks";
      invite_kind: "student" | "parent";
      message_channel: "student" | "parent";
      note_kind: "note" | "meeting";
      note_visibility: "private" | "student" | "parent" | "both";
      task_kind: "study" | "questions" | "reading" | "video" | "review" | "other";
      topic_status: "learning" | "done" | "review";
      user_role: "teacher" | "student" | "parent";
      yks_field: "say" | "ea" | "soz" | "dil";
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
};

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">;

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">];

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R;
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] & DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R;
      }
      ? R
      : never
    : never;

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I;
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I;
      }
      ? I
      : never
    : never;

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U;
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U;
      }
      ? U
      : never
    : never;

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never;

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never;

export const Constants = {
  public: {
    Enums: {
      account_status: ["pending", "active", "rejected", "disabled"],
      exam_kind: ["LGS", "TYT", "AYT", "YDT"],
      exam_track: ["lgs", "yks"],
      invite_kind: ["student", "parent"],
      message_channel: ["student", "parent"],
      note_kind: ["note", "meeting"],
      note_visibility: ["private", "student", "parent", "both"],
      task_kind: ["study", "questions", "reading", "video", "review", "other"],
      topic_status: ["learning", "done", "review"],
      user_role: ["teacher", "student", "parent"],
      yks_field: ["say", "ea", "soz", "dil"],
    },
  },
} as const;
