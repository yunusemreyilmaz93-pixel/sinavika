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
          id: number;
          items: NonNullable<Json>;
          name: string;
          teacher_id: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          id?: never;
          items?: NonNullable<Json>;
          name: string;
          teacher_id?: string;
        };
        Update: {
          created_at?: string;
          id?: never;
          items?: NonNullable<Json>;
          name?: string;
          teacher_id?: string;
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
          application_note: string | null;
          approved_at: string | null;
          branch: string | null;
          consent_at: string | null;
          created_at: string;
          email: string | null;
          full_name: string;
          id: string;
          is_admin: boolean;
          last_seen_at: string | null;
          role: Database["public"]["Enums"]["user_role"];
          school: string | null;
          status: Database["public"]["Enums"]["account_status"];
          username: string | null;
        };
        ComputedFields: never;
        Insert: {
          application_note?: string | null;
          approved_at?: string | null;
          branch?: string | null;
          consent_at?: string | null;
          created_at?: string;
          email?: string | null;
          full_name: string;
          id: string;
          is_admin?: boolean;
          last_seen_at?: string | null;
          role: Database["public"]["Enums"]["user_role"];
          school?: string | null;
          status?: Database["public"]["Enums"]["account_status"];
          username?: string | null;
        };
        Update: {
          application_note?: string | null;
          approved_at?: string | null;
          branch?: string | null;
          consent_at?: string | null;
          created_at?: string;
          email?: string | null;
          full_name?: string;
          id?: string;
          is_admin?: boolean;
          last_seen_at?: string | null;
          role?: Database["public"]["Enums"]["user_role"];
          school?: string | null;
          status?: Database["public"]["Enums"]["account_status"];
          username?: string | null;
        };
        Relationships: [];
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
      students: {
        Row: {
          archived_at: string | null;
          created_at: string;
          daily_minutes_goal: number;
          field: Database["public"]["Enums"]["yks_field"] | null;
          grade: number;
          id: string;
          target: string | null;
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
      preview_invite: {
        Args: { p_code: string };
        Returns: {
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
